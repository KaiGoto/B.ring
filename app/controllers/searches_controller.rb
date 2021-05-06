class SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end
  private
  def match(model, content)
    # 地域名検索
    if model == 'region'
      Region.where(name: content)
    # 場所名検索
    elsif model == 'place'
      Place.where(name: content)
    end
  end

  def forward(model, content)
    if model == 'region'
      Region.where("name LIKE ?", "#{content}%")
    elsif model == 'place'
      Place.where("name LIKE ?", "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'region'
      Region.where("name LIKE ?", "%#{content}")
    elsif model == 'place'
      Place.where("name LIKE ?", "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'region'
      Region.where("name LIKE ?", "%#{content}%")
    elsif model == 'place'
      Place.where("name LIKE ?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    # 完全一致
    when 'match'
      match(model, content)
    # 前方一致
    when 'forward'
      forward(model, content)
    # 後方一致
    when 'backward'
      backward(model, content)
    # 部分一致
    when 'partical'
      partical(model, content)
    end
  end
end