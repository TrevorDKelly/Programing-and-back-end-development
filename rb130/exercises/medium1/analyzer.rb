class TextAnalyzer
  def process
    File.open('text.txt') { |text| yield(text.read) }
  end 
end

analyzer = TextAnalyzer.new

analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(" ").size} words" }

