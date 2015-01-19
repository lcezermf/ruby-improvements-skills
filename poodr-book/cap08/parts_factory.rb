require 'ostruct'

class PartsFactory
  def self.build(config, part_class = Part, parts_class = Parts)
    parts_class.new(
      config.collect { |part_config| create_part(part_config) }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(name: part_config[0], description: part_config[1], needs_spare: part_config.fetch(2, true))
  end
end
