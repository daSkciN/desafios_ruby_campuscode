class CharacterGenerator
  def initialize(characters_config)
    @characters_config = characters_config
  end

  def build
    @characters_config.map do |name, attributes|
      name = name.to_s
      type = attributes[0]
      strength = attributes[1]
      life = attributes[2]
      Character.new(name, type, strength, life)
    end
  end
end
