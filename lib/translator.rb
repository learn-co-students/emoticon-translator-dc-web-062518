require "yaml"
require "pry"

def load_library(file)
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library = YAML.load_file(file)
  library.each do |meaning, emoticon_array|
    japanese_emoticon = emoticon_array[1]
    english_emoticon = emoticon_array[0]
    new_hash["get_meaning"][japanese_emoticon] = meaning
    new_hash["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  new_hash
end

def get_japanese_emoticon(file, english_emoticon)
  var = load_library(file)
  if var["get_emoticon"].has_key?(english_emoticon)
    var["get_emoticon"][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
  var = load_library(file)
  if var["get_meaning"].has_key?(japanese_emoticon)
    var["get_meaning"][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
