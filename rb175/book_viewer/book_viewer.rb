require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @table_of_contents = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, index|
      "<p id=\"paragraph-#{index}\">#{paragraph}</p>"
    end.join
  end

  def highlight(term, text)
    text.gsub(term, "<strong>#{term}</strong>")
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i

  redirect "/" if number > @table_of_contents.size

  @title = "Chapter #{number} - #{@table_of_contents[number - 1]}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @query = params[:query]
  @results = gather_results(@query) if @query

  erb :search
end

not_found do
  redirect "/"
end

def each_chapter
  @table_of_contents.each_with_index do |title, chp_number|
    chp_number += 1
    text = File.read("data/chp#{chp_number}.txt")
    yield(title, chp_number, text)
  end
end

def gather_results(query)
  results = []

  each_chapter do |title, chp_number, text|
    if text.include?(@query)
      results << {
                   title: title,
                   chp_number: chp_number,
                   paragraphs: paragraphs_with_query(text)
                 }
    end
  end

  results
end

def paragraphs_with_query(text)
  paragraphs = {}
  text.split("\n\n").each_with_index do |paragraph, p_number|
    next unless paragraph.include?(@query)
    paragraphs.merge!({ p_number => paragraph } )
  end

  paragraphs
end
