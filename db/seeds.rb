# frozen_string_literal: true

# Modality
modalities = ['karate', 'jiu-jitsu', 'krav maga', 'zumba', 'muay thai', 'boxe']
modalities.each { |modality| Modality.create!(name: modality) }

# User
User.create!(
  first_name: 'Pedro',
  last_name: 'Rimes',
  modality_id: 1,
  email: 'admin_rico@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 'admin'
)

User.create!(
  first_name: 'Lucas',
  last_name: 'Sei la',
  modality_id: 2,
  email: 'professor@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 'teacher'
)

User.create!(
  first_name: 'João',
  last_name: 'Irineu',
  modality_id: 3,
  email: 'aluno@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 'student'
)
