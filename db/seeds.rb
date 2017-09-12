require 'factory_girl'
Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }
Rake::Task['db:migrate:reset'].invoke

items = [
  %w(Qiita http://qiita.com/),
  %w(niconico http://www.nicovideo.jp/),
  %w(github https://github.com/),
  %w(Google https://www.google.co.jp/),
]

items.each do |title, url|
  Item.create!(title: title, url: url)
end
