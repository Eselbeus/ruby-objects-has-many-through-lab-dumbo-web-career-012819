require 'pry'
class Doctor
  attr_accessor :my_appointments, :my_patients
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
    my_appointments = Appointments.all.select do |app|
      app.doctor == self
    end
    @my_appointments = my_appointments
    # binding.pry
  end
  
  def patients
    my_patients = @my_appointments.map do |app|
      app.patient
      # binding.pry
    end
    @my_patients = my_patients
  end
  
  def new_appointment(date, patient)
    appointment = Appointment.new(date, patient, self)
    # binding.pry
    @my_appointments << appointment
  end

end