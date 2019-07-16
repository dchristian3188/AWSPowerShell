ipmo AWSPowerShell.NetCore

Set-DefaultAWSRegion -Region us-east-1

$creds = (Get-AWSCredential default).GetCredentials()
$item = [Amazon.DynamoDBv2.DocumentModel.Document]::new()
#$client = [Amazon.DynamoDBv2.AmazonDynamoDBClient]::new($creds.AccessKey,$creds.SecretKey,[Amazon.RegionEndpoint]::USEast1)
$client = [Amazon.DynamoDBv2.AmazonDynamoDBClient]::new([Amazon.RegionEndpoint]::USEast1)
$table = [Amazon.DynamoDBv2.DocumentModel.Table]::LoadTable($client,'dcTestTable')

$item['email'] = 'myemail@gmail.com'
$item['role'] = 'SA'
$item['status'] = 'intraining'

$request = $table.PutItemAsync($item)