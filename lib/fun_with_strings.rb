module FunWithStrings
  def palindrome?
    plainText = self.downcase.gsub(/[^a-z]/, '')
    plainText.reverse == plainText
  end
  def count_words
    allWords = self.downcase.split(/\s/)
      .collect{|x| x.gsub(/[^a-z]/,'')}
      .select{|x| x!=''}
    uniqueWords = allWords.uniq
    Hash[*uniqueWords.collect{|value| [value, 
      allWords.select{|x| x==value}.size] }.flatten]
  end
  def anagram_groups
    allWords = self.downcase.split(/\s/)
      .collect{|x| x.gsub(/[^a-z]/,'')}
      .select{|x| x!=''}
    groups = allWords.collect{|x|x.split(//).sort}.uniq
    words = groups.collect{|x|self.split(/\s/)
      .select{|all|all.downcase.split(//).sort == x.sort}}
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
