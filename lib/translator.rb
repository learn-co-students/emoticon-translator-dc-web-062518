require 'yaml'

def load_library(library)
  emoticons = YAML.load_file(library)
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |english_word, emoticon_set|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
 emoticons = load_library(path)
 x = emoticons["get_emoticon"][emoticon]
 if x == nil 
  return "Sorry, that emoticon was not found"
end
return x
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  x = emoticons["get_meaning"][emoticon]
  if x == nil
    return "Sorry, that emoticon was not found"
  end
  return x
  
end