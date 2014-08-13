require 'tdameritrade_api'

module TDAStreamDaemon
  class StreamDaemon

    attr_accessor :alerts
    attr_reader :watchlist  # mainly for debug purposes

    def initialize
      @watchlist = Hash.new # A hash of each symbol we are watching. Value column will be a hash of the data associated
      @alerts = Hash.new # symbol, with the time of the alert
      @tda_client = TDAmeritradeApi::Client.new
      raise Exception.new("Unable to connect to TD Ameritrade API") if !@tda_client.login
    end

    # Run the alerts daemon to notify of parabolics and washes
    # The parameter stream is a TDAmeritradeApi::Streamer object
    def run(stream, opt={})
      # Get yesterday's 5-min charts for each item on the watchlist to set the average true range
      # opt[:stream_date] will be the day that the stream is supposed to be happening (default is today)
      # stream.symbols will be the watchlist of 5min charts we need to pull up

      puts "Getting data for true range moving average"
      symbols = symbols_from_watchlist
      symbols.each do |symbol|
        puts "Downloading #{symbol}"
        opt.has_key?(:stream_date) ? end_date = opt[:stream_date]-1 : end_date = Date.today - 1
        prices = @tda_client.get_price_history(symbol, intervaltype: :minute, intervalduration: 5, periodtype: :day, period: 1, enddate: end_date).pop(61)
        average_true_range = prices.each_cons(2).to_a.map { |p| calculate_true_range(p[0], p[1]) }.inject { |sum, tr| sum + tr }.to_f / 60
        puts "#{symbol} ATR: #{average_true_range}"
      end


      #stream.run do |data|
        # for each stream record
        # 1. Skip it if the timestamp is not up to date.
        # 2. Calculate the current true range
        # 3. Calculate the average true range
        # 4. Process alert
        #   - if it meets the alert criteria, send it if it hasn't been alerted in the last 20 min

      #end
    end

    private

    def calculate_true_range(candle1, candle2)
      [candle2[:high] - candle2[:low],
      candle2[:high] - candle1[:close],
      candle1[:close] - candle2[:low]].max
    end

    def symbols_from_watchlist
      wl_file = File.join(Dir.pwd, 'run', 'watchlist.txt')
      f = File.open(wl_file, 'r')
      list = f.read().split("\n")
      f.close
      list
    end
  end
end