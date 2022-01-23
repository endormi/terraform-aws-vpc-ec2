// There are multiple ways you can get the IP.
// rate-limited to 1 request per min
data "http" "myip" {
  url = "https://ifconfig.co/json"
  request_headers = {
    Accept = "application/json"
  }
}

// ["${jsondecode(data.http.myip.body).ip}/32"]
