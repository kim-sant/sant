module ApplicationHelper
  
  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? content_for(:meta_keywords) : "Sant, idrinksant, superfruit beverage, superfruit recipe, superfood, yoga, superfruit tea"
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : "The dried superfruit that transforms into a fresh beverage."
    end
  end

  def construction
    redirect to ""
  end
  
end
