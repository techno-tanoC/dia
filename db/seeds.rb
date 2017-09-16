require 'factory_girl'
Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }
Rake::Task['db:migrate:reset'].invoke

items = [
  ["Qiita", "http://qiita.com/", "programming"],
  ["niconico", "http://www.nicovideo.jp/", "movie"],
  ["github", "https://github.com/", "programming"],
  ["Google", "https://www.google.co.jp/"],
]

items.each do |title, url, tag|
  Item.create!(title: title, url: url, tag_list: tag)
end
