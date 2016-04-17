#!/usr/bin/env ruby

require 'json'
require 'csv'

data = JSON.parse(IO.read(ARGV[0]))
csv_prefix = File.basename(ARGV[0], ".json")

STD_FILE = "#{csv_prefix}.std.csv"
PRC_FILE = "#{csv_prefix}.prc.csv"
standard = CSV.new(File.open(STD_FILE, "w"))
pronunc  = CSV.new(File.open(PRC_FILE, "w"))

data.each do |d|
  standard << [d["ja"], "#{d["pr"]}\n#{d["en"]}"]
  pronunc  << [d["pr"], d["en"]]
end

standard.close
pronunc.close

$stderr.puts "cards saved to #{STD_FILE} and #{PRC_FILE}"
$stderr.puts "Import files using AnkiApp Nexus: https://api.ankiapp.com/nexus/"
