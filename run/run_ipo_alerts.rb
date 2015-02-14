##### THIS FILE SHOULD BE DEPRECATED AS IT WAS DISCOVERED THAT YOU CANT RUN TWO STREAMS SIMULTANEOUSLY
##### ONLY LEAVING IT HERE FOR CODE SAMPLES FOR FUTURE SYSTEMS

$:.unshift File.join(Dir.pwd, 'lib'), "/Users/wkotzan/Development/gem-development/tdameritrade_api"
require 'tda_stream_daemon'
require 'tdameritrade_api'
require 'date'
require 'rufus-scheduler'

begin
  puts "Starting up IPO Alerts Daemon: #{Time.now}"
  c = TDAmeritradeApi::Client.new
  c.login
  streamer = c.create_streamer


  symbol_list = ['PG', 'DEA', 'CPPL', 'NVET', 'PUMP', 'AAAP', 'ITEK', 'IDGX', 'REDX']
  streamer.run(symbols: symbol_list, request_fields: [:volume, :last, :symbol, :quotetime, :tradetime]) do |data|
    unless data.columns.nil? || data.columns[:symbol].nil? || data.columns[:last].nil?
      if symbol_list.index(data.columns[:symbol])
        puts "#{data.columns[:symbol]} open for business"
        system("say 'I-P-O #{data.columns[:symbol]} open for business'")
        symbol_list.delete(data.columns[:symbol])
      end
    end
  end


rescue Exception => e
  if e.class != Interrupt
    2.times { system("say 'Help me! The IPO alert system has crashed!'") }
    raise e
  end
end