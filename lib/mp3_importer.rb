require 'pry'
class MP3Importer
  def initialize( path )
    @path = path
    files = Dir.glob("#{path}/*\.mp3")
    @files = files.map do |file|
      file.split('/').last
    end
  end
  attr_reader :path, :files
  ####################################################
  def import
    @files.each do |file|
      Song.new_by_filename( file )
    end
  end

end
