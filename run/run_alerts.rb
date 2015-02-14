$:.unshift File.join(Dir.pwd, 'lib'), "/Users/wkotzan/Development/gem-development/tdameritrade_api"
require 'tda_stream_daemon'
require 'tdameritrade_api'
require 'date'
require 'rufus-scheduler'


# set it up so that if starting in the middle of the day it calibrates the morning
run_mock = true
run_schedule = false

if run_mock
  #stream_date = Date.parse(f.match('.*stream_archive_(.*)-\d*\.binary')[1])
  input_file = File.join(Dir.pwd, 'cache', 'test_data', 'stream20150213-should-have-WUBA-1010am.binary')
  streamer = TDAmeritradeApi::Streamer::Streamer.new(read_from_file: input_file)
  sd = TDAStreamDaemon::StreamDaemon.new
  sd.run(streamer, stream_date: Date.new(2015, 2, 13), skip_calibration_download: true)
else
  begin
    c = TDAmeritradeApi::Client.new
    c.login
    streamer = c.create_streamer
    streamer.output_file = '/Users/wkotzan/Development/gem-development/tda_stream_daemon/cache/stream20150205.binary'

    if run_schedule
      #this isn;t working so skip this feature
      # scheduler = Rufus::Scheduler.new
      # scheduler.cron('0 8 * * MON-FRI') do
      #   puts "Starting up Alerts Daemon: #{Time.now}"
      #   sd = TDAStreamDaemon::StreamDaemon.new
      #   sd.run(streamer, stream_date: Date.today, stop_time: 1900)
      # end
      #
      # while 1
      #   # prevent the program from ending so that the scheduler can run indefinitely
      #   sleep 100
      # end
      #
    else
      sd = TDAStreamDaemon::StreamDaemon.new
      sd.run(streamer, stream_date: Date.today)
    end
  rescue Exception => e
    if e.class != Interrupt
      2.times { system("say 'Help me! The system has crashed!'") }
      raise e
    end
  end
end


