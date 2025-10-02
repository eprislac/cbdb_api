# frozen_string_literal: true

colorize_logs_formatter = ColorizeLogs::Formatter.new

colorize_logs_formatter.configure do
  match(/ERROR/) do |msg|
    msg.red
  end

  match(/INFO/) do |msg|
    msg.green
  end

  match(/DEBUG/) do |msg|
    msg.blue
  end

  match(/WARN/) do |msg|
    msg.yellow
  end

  match(/Completed/) do |msg|
    msg.green
  end
end

::Rails.logger.formatter = colorize_logs_formatter
