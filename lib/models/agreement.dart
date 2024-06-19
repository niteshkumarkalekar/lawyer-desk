class Agreement{
  List<Statement> statements;
  
  Agreement({required this.statements});
  
  static Agreement sample = Agreement(statements: Statement.samples);
}

class Statement{
  String title;
  String description;
  Statement({required this.title, required this.description});
  
  static List<Statement> samples = [
    Statement(title: "Parties", description: "Writer is engaged in the business of writing articles and other materials on a freelance basis. Newspaper is engaged in the business of newspaper publication."),
    Statement(title: "Relationship", description: "The parties expressly agree and acknowledge that the relationship created by this Agreement is one of Independent Contractor. Newspaper is not the employer of Writer"),
    Statement(title: "Contract Period", description: "This agreement will begin on the date set forth below and shall continue until terminated as provided by either party. If either party violates a term of this Agreement"
        ""),
    // Statement(title: "Services to be Provided", description: "Writer agrees to submit, on his or her sole initiative, written articles to the Newspaper on the following subjects, _____________________ (the \"Articles\")."
    //     "")
  ];
}