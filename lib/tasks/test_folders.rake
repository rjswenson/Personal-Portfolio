if (Rails.env == "test" || Rails.env == "development")
  MiniTest::Rails::Testing.default_tasks << "features"
  MiniTest::Rails::Testing.default_tasks << "projects"
end
