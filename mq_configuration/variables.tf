variable  "mq_conf" {
  description = "MQ_CONF"
  type = map(object({
    data = string
    description = string
    engine_type = string
    engine_version = string
    name = string
    tags = map(string)
    }))
  default = {
    mq_conf1 = {
      data = <<-DATA
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <broker xmlns="http://activemq.apache.org/schema/core">
        <plugins>
        <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
        <statisticsBrokerPlugin/>
        <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
        </plugins>
        </broker>
        DATA
      description = "default MQ_conf description"
      engine_type = "ActiveMQ"
      engine_version = "5.15.14"
      name = "Default MQ_conf name"
      tags = {
        "Name" : "Dafault MQ tag name"
      }
      
  }}
  }