require "sketchup.rb"
#require "langhandler.rb"
module Obeirn
  module LayerTools

  #Check if file already loaded
    unless file_loaded?( __FILE__ )

      hide_layers = UI::Command.new("Hide layers") {
    	#Get all layers of selected items
    	layers =[]
        model = Sketchup.active_model

        selection = model.selection

        selection.each { |entity| 
    		layers << entity.layer
    		}
        #Hide each layer
    	layers.each { |layer|
    		layer.visible = false}

    }

    show_layers = UI::Command.new("Show all layers") {
    	#Get all layers of selected items
        model = Sketchup.active_model

        layers = model.layers
        #Show each layer
        layers.each { |layer|
        layer.visible = true}
      }


    #Access Sketchup's Context menu
      UI.add_context_menu_handler do |menu|
      	menu.add_separator
        item = menu.add_item hide_layers
        item = menu.add_item show_layers
     	
      end
    #Mark plugin as loaded
    file_loaded __FILE__
    end
  end
end