Redmine::Plugin.register :redmine_exception_handler do
  name 'Redmine Exception Handler plugin'
  author 'Eric Davis'
  description 'Send emails when exceptions occur in Redmine.'
  version ExceptionHandler::Version.to_s
  requires_redmine :version_or_higher => '2.5.0'

  settings :default => {
    'exception_handler_recipients' => 'you@example.com, another@example.com',
    'exception_handler_sender_address' => 'Application Error <redmine@example.com>',
    'exception_handler_prefix' => '[ERROR] ',
    'exception_handler_email_format' => 'text'
  }, :partial => 'settings/exception_handler_settings'

end

options = {
  sections: %w(request session environment backtrace),
}
ExceptionNotifier.register_exception_notifier(:email, options)
