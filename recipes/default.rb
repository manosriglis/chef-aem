directory node['aem']['install_path'] do
  action :create
end

# download AEM jar
remote_file "#{node['aem']['install_path']}/cq5-author-p4502.jar" do
  source "#{node['aem']['aem_remote_path']}"
  action :create_if_missing
end

directory "#{node['aem']['install_path']}/filevault" do
  action :create
end

# download VLT
remote_file "#{node['aem']['install_path']}/filevault/filevault.tgz" do
  source "#{node['aem']['vlt_remote_path']}"
  action :create_if_missing
end

file "#{node['aem']['install_path']}/license.properties" do
  content "#Adobe Granite License Properties
#Tue Feb 28 10:45:30 EST 2012
license.product.name=Adobe CQ5
license.customer.name=#{node['aem']['license_customer_name']}
license.product.version=5.5.0
license.downloadID=#{node['aem']['license_download_id']}
"
  action :create_if_missing
end

bash 'install_aem' do
  if !File.exists?("#{node['aem']['install_path']}/crx-quickstart/sling.properties")
    code <<-EOH
    cd "#{node['aem']['install_path']}"
    java -XX:MaxPermSize=256m -Xmx1024M -jar cq5-author-p4502.jar &
    EOH
  end
end

bash 'start_aem' do
  if !File.exists?("#{node['aem']['install_path']}/crx-quickstart/repository/.lock")
    code <<-EOH
    cd "#{node['aem']['install_path']}/crx-quickstart/bin"
    start &
    EOH
  end
end

bash 'install_vlt' do 
  if !File.exists?("#{node['aem']['install_path']}/filevault/vault-cli-2.4.34/bin/vlt")
    code <<-EOH
    cd #{node['aem']['install_path']}/filevault/
    tar -xvzf filevault.tgz
    ln -s #{node['aem']['install_path']}/filevault/vault-cli-2.4.34/bin/vlt /usr/bin/vlt
    EOH
  end
end