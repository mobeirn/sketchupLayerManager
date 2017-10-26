require "sketchup.rb"
#require "langhandler.rb"
module Obeirn
  module LayerTools

  #Check if file already loaded
    unless file_loaded?( __FILE__ )

      ex = SketchupExtension.new('Layer Manager', 'layer_manager/main')
      ex.description = 'Layer manager'
      ex.version     = '1.0.0'
      ex.copyright   = 'Malcolm OBeirn © 2017'
      ex.creator     = 'MOB'

      Sketchup.register_extension(ex, true)

    	file_loaded(__FILE__)
    end

  end # module LayerTools
end # module Obeirn