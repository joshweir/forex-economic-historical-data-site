#!/usr/bin/env ruby

#bundle exec /home/resrev/forex-economic-data/lib/tasks/scrape_investing_com_events.rb development_scraper
ENV['RAILS_ENV'] = ARGV[0] || 'production'
if %w(production_scraper development_scraper).include? ENV['RAILS_ENV']
  require File.dirname(__FILE__) + '/../../config/environment'
  opts = Slop.parse do |o|
    o.separator 'eg usage:'
    o.separator 'development_scraper --method seed'
    o.integer '-j','--id', 'just scrape this id forms url like: ' +
                          'https://www.investing.com/economic-calendar/<id>'
    o.integer '-s','--id_start', 'if querying a table to scrape, this is the beginning of id range'
    o.integer '-e','--id_end', 'if querying a table to scrape, this is the end of id range'
    o.string '-c', '--connection_method', 'serial_proxies, parallel_proxies, tor, serial_vpns'
    o.string '-r', '--connection_class', 'default: ProxyIp. If the proxy list/vpn list is to be retrieved from a table, ' +
      'indicates the table name.', default: 'ProxyIp'
    o.array '-x', '--connection_list', 'list of proxies/vpns eg: 192.168.1.1:12332,192.168.1.1:12333. ' +
      'Note that this overrides the --connection_class option.'
    o.integer '-p', '--processes', 'number of concurrent instances of this scraper to run.', default: 1
    o.string '-h', '--humanize_method', 'humanize method to use: none, medium, strict. ' +
      'none (default): no sleeping between requests no rotating. medium: 0.2s-4s between. strict: 1s-36s between. ' +
      'medium and strict will also rotate proxies/vpns after 10-50 successful requests.', default: 'none'
    o.bool '-b', '--sleep_on_bail', 'If a process has determined to bail (due to block etc) if this option ' +
      'is set the process will sleep the number of seconds indicated in --sleep_time_secs before rotating proxy or ' +
      'bailing if no --connection_method method used.  '
    o.integer '-l', '--sleep_time_secs', 'default: 600. If --sleep_on_bail is set, then sleep this number of seconds. ' +
      'See -sleep_on_bail option for more info.', default: 600
    o.bool '-n', '--never_exit_on_bail', 'If a process has determined to bail (due to block etc) if this option ' +
      'is set the process will never exit even if it normally would, it will just keep going. '
    o.integer '-t', '--tor_base_port', 'default: 10050. If --connection_method is tor, this is the base tor port. ' +
      'Depending on the number of --processes each process will increment the torbaseport from this number', default: 10050
    o.integer '-u', '--tor_control_port', 'default: 11050. If --connection_method is tor, this is the base tor control port. ' +
      'Depending on the number of --processes each process will increment the torbasecontrolport from this number', default: 11050
    o.string '-i', '--instance_alias', 'Allowing you to run the same scraper multiple times use a different instance alias.'
    o.bool '-y', '--email_on_server_block', 'If the server blocks the request, then send an email with the summary of success before block. '
    o.bool '-z', '--logging', 'log to file. '
    o.on '-v', '--version' do
      puts "0.1"
      exit!
    end
    o.on '--help' do
      puts o
      exit!
    end
  end



  puts 'hello world'

end
