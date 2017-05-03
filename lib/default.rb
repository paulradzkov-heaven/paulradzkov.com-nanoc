# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

  def keywords
    if is_front_page?
      tag_set.join(', ') 
    else
      tags = @item[:tags].nil? ? '' : @item[:tags].join(', ') 
      keywords = @item[:keywords] || ''
      [keywords, tags].join(', ')
    end
  end
  
  
  def link_unless_current(name, s)
	if @item.identifier != "/#{s}/"
		"<li><a href='/#{s}/'>#{name}</a></li>"
	else
		"<li><span class=\"active\">#{name}</span></li>"
	end
  end
  
  
	def nav_link_to_unless_current(text, path) 
	  if @item_rep and @item_rep.path == path 
		"<span class=\"active\" title=\"Вы здесь\"><span>#{text}</span></span>" 
	  else 
		"<a href=\"#{path}/\"><span>#{text}</span></a>" 
	  end 
	end
  
  def logo
    if is_front_page?
      site_name
    else
      "<a href='/'>#{site_name}</a>"
    end
  end

# Переопределяем имена месяцев
RUSMONTHS = {
  1 => "Января", 2 => "Февраля", 3 => "Марта",
  4 => "Апреля", 5 => "Мая", 6 => "Июня",
  7 => "Июля", 8 => "Августа", 9 => "Сентября",
  10 => "Октября", 11 => "Ноября", 12 => "Декабря"
}

RUSMON = {
  1 => "Январь", 2 => "Февраль", 3 => "Март",
  4 => "Апрель", 5 => "Май", 6 => "Июнь",
  7 => "Июль", 8 => "Август", 9 => "Сентябрь",
  10 => "Октябрь", 11 => "Ноябрь", 12 => "Декабрь"
}

# Метод для форматирования даты
def blogpost_date(blog_date)
    blog_date = blog_date.is_a?(String) ? Date.parse(blog_date) : blog_date
    "#{blog_date.mday} #{RUSMONTHS[blog_date.mon]} #{blog_date.year}"
end

# Год написания поста, иначе — текущий год
def blogpost_year(blog_date)
	if blog_date
		blog_date = blog_date.is_a?(String) ? Date.parse(blog_date) : blog_date
		"#{blog_date.year}"
	else
		time = Time.new
		"#{time.year}"
	end
end