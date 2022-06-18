# Modality

modalities = ['karate', 'jiu-jitsu', 'krav maga', 'zumba', 'muay thai', 'boxe']
modalities.each { |modality| Modality.create!(name: modality) }
