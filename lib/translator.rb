require "yaml"
require 'pry'

def load_library(file_path)
  emoticon = YAML.load_file(file_path)
  new_emoticons = {}
  new_emoticons["get_meaning"] = {}
  new_emoticons["get_emoticon"] = {}
  emoticon.each do |english, japanese|
      new_emoticons["get_meaning"][japanese.last] = english
      new_emoticons["get_emoticon"][japanese.first] = japanese.last
    end
  new_emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  equal = emoticons["get_emoticon"][emoticon]
  if equal == nil
    return "Sorry, that emoticon was not found"
  else
    return equal
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  equal = emoticons["get_meaning"][emoticon]
  if equal == nil
    return "Sorry, that emoticon was not found"
  else
    return equal
  end
end
