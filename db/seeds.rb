require 'factory_girl'
Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }
Rake::Task['db:migrate:reset'].invoke

items = [
  %W(Qiita http://qiita.com/ #{%(programming Qiita)}),
  %W(niconico http://www.nicovideo.jp/ movie),
  %W(Github https://github.com/ programming),
  %W(Google https://www.google.co.jp/),
  %W(Materialize http://materializecss.com/ programming),
  %W(YouTube https://www.youtube.com/ movie),
]

items.each do |title, url, tag|
  Item.create!(title: title, url: url, tag_list: tag)
end

Rule.create!(target: "url", regex: "^http://qiita.com/", tag: "Qiita")
