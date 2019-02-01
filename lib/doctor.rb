require 'pry'
class Doctor
  attr_accessor :my_appointments, :patients
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
    my_appointments = Appointment.all.select do |app|
      app.doctor == self
    end
    @my_appointments = my_appointments
  end

  def patients
    patients = @my_appointments.map do |app|
      binding.pry
      app.patient
    end
    @patients = patients
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

end