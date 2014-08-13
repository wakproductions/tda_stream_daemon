module TDAStreamDaemon
  class StreamDaemon

    attr_accessor :alerts

    def initialize
      @watchlist = Hash.new # A hash of each symbol we are watching. Value column will be a hash of the data associated
      @alerts = Hash.new # symbol, with the time of the alert
    end

    # Run the alerts daemon to notify of parabolics and washes
    # The parameter stream is a TDAmeritradeApi::Streamer object
    def run(stream, opt={})
      # Get yesterday's 5-min charts for each item on the watchlist to set the average true range
      # opt[:stream_date] will be the day that the stream is supposed to be happening (default is today)
      # stream.symbols will be the watchlist of 5min charts we need to pull up


      stream.run do |data|
        # for each stream record
        # 1. Skip it if the timestamp is not up to date.
        # 2. Calculate the current true range
        # 3. Calculate the average true range
        # 4. Process alert
        #   - if it meets the alert criteria, send it if it hasn't been alerted in the last 20 min

      end
      end
    end
  end
end