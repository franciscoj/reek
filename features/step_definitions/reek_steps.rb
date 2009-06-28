When /^I run reek (.*)$/ do |args|
  run args
end

When /^I pass "([^\"]*)" to reek$/ do |stdin|
  run_with_pipe stdin
end

When /^I run rake reek$/ do
  rake
end

Then /^stdout equals "([^\"]*)"$/ do |report|
  @last_stdout.should == report
end

Then /^it succeeds$/ do
  @last_exit_status.should == 0
end

Then /^it fails with exit status (\d+)$/ do |status|
  @last_exit_status.should == status.to_i
end

Then /^it reports:$/ do |report|
  @last_stdout.should == report
end

Then /^it reports the error ['"](.*)['"]$/ do |string|
  @last_stderr.chomp.should == string
end

Then /^it reports the current version$/ do
  @last_stdout.chomp.should == "reek #{Reek::VERSION}"
end