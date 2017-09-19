class QueryController < ApplicationController
  def menu
  end

  def tags
    @tags = ActsAsTaggableOn::Tag.all
  end

  def search
    @items = Item.eager_load(:tags).reverse_order
    @items = search_params.inject(@items) do |items, (type, str)|
      case type
      when :tag
        items.where("lower(tags.name) LIKE ?", "%#{str.downcase}%")
      when :title
        items.where("lower(title) LIKE ?", "%#{str.downcase}%")
      when :url
        items.where("lower(url) LIKE ?", "%#{str.downcase}%")
      else
        items
      end
    end
  end

  private
  def search_params
    params[:search].split.map {|str|
      case str
      when /tag:(\S+)/ then [:tag, $1]
      when /title:(\S+)/ then [:title, $1]
      when /url:(\S+)/ then [:url, $1]
      else [:word, str]
      end
    }.compact
  end
end
