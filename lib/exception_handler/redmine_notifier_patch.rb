module ExceptionHandler
  module RedmineNotifierPatch
    def notify_exception(exception, options = {})
      settings = Setting.plugin_redmine_exception_handler
      options[:exception_recipients] = settings['exception_handler_recipients'].split(',').map(&:strip)
      options[:sender_address] = settings['exception_handler_sender_address']
      options[:email_prefix] = settings['exception_handler_prefix']
      options[:email_format] = (settings['exception_handler_email_format'] || 'text').to_sym
      super(exception, options)
    end
  end
end
