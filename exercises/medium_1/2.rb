# Uses File.read
class TextAnalyzer
  def process
    yield(File.read('sample_text.txt'))
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |content| puts "#{content.split("\n\n").size} paragraphs" }
analyzer.process { |content| puts "#{content.lines.size} lines" }
analyzer.process { |content| puts "#{content.split.size} lines" }
puts "============================================="

# Uses File.open {}
class TextAnalyzer
  def process
    File.open("sample_text.txt", "r") do |file|
      content = file.read
      yield(content)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |content| puts "#{content.split("\n\n").size} paragraphs" }
analyzer.process { |content| puts "#{content.lines.size} lines" }
analyzer.process { |content| puts "#{content.split.size} lines" }
puts "============================================="

# Uses sandwich code
class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |content| puts "#{content.split("\n\n").size} paragraphs" }
analyzer.process { |content| puts "#{content.lines.size} lines" }
analyzer.process { |content| puts "#{content.split.size} lines" }