require 'rubygems'
require 'post_haste'
require 'csv'
require 'date'
include PostHaste

loop do
  date = Date.today.to_s.gsub('-','')
  mv_web = MostViewed.all('web', 100)
  mv_mobile = MostViewed.all('mobile', 100)
  file_name = "csv/#{date}.csv"
  f = File.open(file_name)
  wh = f.size > 50 ? false : true
  CSV.open(file_name, "a+", :write_headers => wh, :headers => ['date','platform','type','datetime','title','byline','url','rank']) do |row|
    mv_web.each do |mv|
      row << [mv.datetime.to_date, mv.platform, mv.type, mv.datetime, mv.title, mv.byline, mv.url, mv.rank]
    end
    mv_mobile.each do |mv|
      row << [mv.datetime.to_date, mv.platform, mv.type, mv.datetime, mv.title, mv.byline, mv.url, mv.rank]
    end
  end
  system 'git add csv/'
  system "git commit -m 'updated from #{mv_web.first.datetime.to_s}'"
  system 'git push origin master'
  sleep(3600)
end
