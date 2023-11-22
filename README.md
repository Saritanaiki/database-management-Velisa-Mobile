# database-management-Velisa-Mobile

VelisaDB serves as an all-encompassing mobile phone management system meticulously crafted to streamline the organization, retrieval, and analysis of fabricated customer data. This system integrates a well-constructed Entity-Relationship Diagram (ERD), relational schema, and SQL tables for effective data structuring. It's essential to clarify that all data within the system is entirely fictional, exclusively employed for showcasing proficiency in database creation and querying skills in a demonstrative context.

**Use Case**

Velisa, a mobile phone company, wishes to develop a database system to record its calls and billing information. 
Each outgoing call consists of a customer who rings a destination from a particular location (called a base station). The destination can be either another customer in the same network, a customer in another mobile network, a customer in a fixed line network or an international call. The customer making the call can be either in their home country (standard call) or making a call from another country (a roaming call). Every call has a duration and a price. Incoming calls are not part of the system and may be ignored. 
In addition, the mobile network needs to keep a track of where phones are to ensure each mobile phone is reachable. To do this each phone periodically sends out a beacon message which identifies it to the nearest base station. The time the phone was seen, and the signal strength are recorded. 
Each Velisa customer has a unique phone number, a sim card number and an account type which is either contract or pay as you go (PAYG). Contract-customers have an account number, customer name and address and the bank account details. Each contract-customer is a member of one of two banks: Vadarbank or Lukebank. Vadarbank stores a huge amount of information about its customers but for simplicity assume it is one multi-valued attribute called 'details'. Lukebank stores just a customer id. For PAYG customers no bank information is recorded; only the credit on the simcard is recorded.

**Tasks:**

•	Develop an Entity-Relationship model of the information requirements for the use case.

•	Translate the model into an equivalent relational schema. Specify all relation headings, indicating primary and foreign keys. 

•	Implement the entities from your relational schema in SQL

•	Execute 5 test cases for the SQL database technology and implement using queries and show the output.

