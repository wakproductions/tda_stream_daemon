$:.unshift File.join(Dir.pwd, 'lib'), "/Users/wkotzan/Development/gem-development/tdameritrade_api"
require 'tda_stream_daemon'
require 'tdameritrade_api'
require 'date'
require 'rufus-scheduler'


# set it up so that if starting in the middle of the day it calibrates the morning
run_mock = false
run_schedule = true

if run_mock
  Dir[File.join(Dir.pwd, 'run', 'test_data', '*20140813-012.binary')].each do |f|
    puts "Processing file #{f}"
    #input_file = File.join(Dir.pwd, 'run', 'test_data', 'stream_archive_20140812-01.binary')
    input_file = f
    stream_date = Date.parse(f.match('.*stream_archive_(.*)-\d*\.binary')[1])
    streamer = TDAmeritradeApi::Streamer::Streamer.new(read_from_file: input_file)
    sd = TDAStreamDaemon::StreamDaemon.new
    sd.run(streamer)
  end

else
  c = TDAmeritradeApi::Client.new
  c.login
  streamer = c.create_streamer
  sd = TDAStreamDaemon::StreamDaemon.new

  if run_schedule
    scheduler = Rufus::Scheduler.new
    scheduler.cron('0 8 * * MON-FRI') do
      puts "Starting up Alerts Daemon: #{Time.now}"
      sd.run(streamer, stream_date: Date.today, stop_time: 1900)
    end

    while 1
      # prevent the program from ending so that the scheduler can run indefinitely
    end

  else
    sd.run(streamer, stream_date: Date.today)
  end
end


