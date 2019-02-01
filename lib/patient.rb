class Patient
  attr_accessor :appointments, :doctors
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @all
  end

  def appointments
    appointments = Appointment.all.select do |app|
      app.patient == self
    end
    @appointments = appointments
  end


  def doctors
    doctors = @appointments.map do |app|
      app.doctor
    end
    @doctors = doctors
  end

end