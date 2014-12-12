# Exemplo onde o uso de Switch/case deve ser removido

# Analisando esse código é possível ver que todos os `preparers` compartilham algo em comum
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Mechanic       then preparer.prepare_bicycles(bicycles)
      when TripCoodinator then preparer.buy_food(customers)
      when Driver then
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end # case
    end
  end
end
