require 'rubygems'
require 'post_haste'
require 'csv'
include PostHaste

loop do
  mv_web = MostViewed.all('web', 100)
  mv_mobile = MostViewed.all('mobile', 100)
  CSV.open('csv/results.csv', 'a') do |row|
    mv_web.each do |mv|
      row << [mv.datetime.to_date, mv.platform, mv.type, mv.datetime, mv.title, mv.byline, mv.url, mv.rank]
    end
    mv_mobile.each do |mv|
      row << [mv.datetime.to_date, mv.platform, mv.type, mv.datetime, mv.title, mv.byline, mv.url, mv.rank]
    end
  end
  system 'git add csv/results.csv'
  system "git commit -m 'updated from #{mv_web.first.datetime.to_s}'"
  system 'git push origin master'
  sleep(1800)
end
