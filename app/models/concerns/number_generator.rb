module NumberGenerator
	extend ActiveSupport::Concern

	LENGTH = 10
	NUMBER_PREFIX = "N"

	included do
		before_validation :generate, on: :create
		validates :number, presence: true, uniqueness: true
	end

	def generate(opts = {})
		opts[:prefix] ||= NUMBER_PREFIX
		opts[:length] ||= LENGTH
		# Generate the allowed set of numbers
		allowed_values = (0..9).to_a

		self.number ||= loop do
			# Generate the possible value
			possible_value = "#{opts[:prefix]}#{(0...opts[:length]).map { allowed_values.sample }.join}"

			if self.class.exists?(number: possible_value)
				opts[:length] += 1 if self.class.count > (10**(opts[:length] / 2))
			else
				break possible_value
			end
		end
	end
end