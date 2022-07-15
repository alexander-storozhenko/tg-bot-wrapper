require 'nokogiri'
require 'open-uri'

class Parser

  def parse(url)
    @doc = Nokogiri::HTML.parse(open(url))
  end

  def parse_vk_post(url)
    # doc = Nokogiri::HTML.parse(open('https://vk.com/wall-196859246_49554?access_key=8e88fe18562f05ad81'))
    # style = doc.css('//a[@aria-label="фотография"]').first.children.first.attributes['style']
    #
    # img_url = style.value.split(';').select{|s| s.include?('background-image')}.first

  end

  def extract_text
    @doc.css('.pi_text').children.first.text
  end

  def extract_images
    @doc.css('//a[@aria-label="фотография"]').map do |img|
      style = img.children.first.attributes['style']
      bg = style.value.split(';').select{|s| s.include?('background-image')}.first
      bg.split('background-image:')[1].gsub('url', '').strip.gsub('(', '').gsub(')', '')
    end
  end
end
