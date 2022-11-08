import SQLBaseKit

public class DriverManagerDataSource {
  public var url: String?

  public var username: String?

  public var password: String?

  public var properties: [String: String] = [:]

  init() {

  }

  func setDriverClassName(className: String) {}

  func getConnection() -> Connection {
    return getConnectionFromDriver(username: self.username!, password: self.password!)
  }

  func getConnectionFromDriver(username: String, password: String) -> Connection {
    properties["user"] = username
    properties["password"] = password
    return getConnectionFromDriver(properties: properties)
  }

  func getConnectionFromDriver(properties: [String: String]) -> Connection {
    return getConnectionFromDriverManager(url: url, properties: properties)
  }

  func getConnectionFromDriverManager(url: String?, properties: [String: String]) -> Connection {
    return DriverManager.getConnection(url: url, properties: properties)
  }
}
