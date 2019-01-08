require "sketchup.rb"
#require "langhandler.rb"
module Obeirn
  module LayerTools

    def hide_layers
      model = Sketchup.active_model
      model.start_operation("Manage Layers", true)
      selection = model.selection
      layers = []

      selection.each { |entity| 
      ent_layer = entity.layer
      layers << ent_layer
      }
      #remove duplicate layers
      unique_layers = layers.uniq!
      #can return nil
      if unique_layers.nil?
        unique_layers = layers 
      end

      unique_layers.each { |layer|
      layer.visible = false unless layer.model.active_layer}
      model.commit_operation
    end

    #Access Sketchup's Context menu
    UI.add_context_menu_handler do |context_menu|
      context_menu.add_separator
      context_menu.add_item(hide_layers)
    end
    file_loaded __FILE__
    end
  end
end