require 'pry'
class Doctor

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
   Appointment.all.select do |app|
      app.doctor == self
    end
   
  end

  def patients
    self.appointments.map {|appo| appo.patient}
    binding.pry
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

end