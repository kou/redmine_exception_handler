class ExceptionsApp
  class << self
    def call(env)
      exception = env["action_dispatch.exception"]
      settings = Setting.plugin_redmine_exception_handler
      options = {
        email_format: (settings['exception_handler_email_format'] || 'text').to_sym,
        email_prefix: settings['exception_handler_prefix'],
        env: env,
        exception_recipients: settings['exception_handler_recipients'].split(',').map(&:strip),
        sender_address: settings['exception_handler_sender_address'],
      }
      ExceptionNotifier.notify_exception(exception, **options)
      ActionDispatch::PublicExceptions.new(Rails.public_path).call(env)
    end
  end
end
