require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true

  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  config.public_file_server.headers = {
    "cache-control" => "public, max-age=#{1.year.to_i}"
  }

  # Active Storage は S3 を使う場合は :amazon に変更してください
  config.active_storage.service = :local

  # セキュリティ設定（SSL強制）
  config.assume_ssl = true
  config.force_ssl = true

  # ログ
  config.log_tags = [ :request_id ]
  config.logger   = ActiveSupport::TaggedLogging.logger(STDOUT)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.silence_healthcheck_path = "/up"

  # ✅ SolidCache を無効化（原因の回避）
  config.cache_store = :memory_store

  # ✅ ActiveJob（solid_queue を使っていれば OK）
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = {
    database: { writing: :queue }
  }

  config.action_mailer.default_url_options = { host: "example.com" }

  config.i18n.fallbacks = true
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [ :id ]
end
