class ArticleModel{

  final String? image;
  final  String? title;
  final  String? author;
  final  DateTime? dateTime;
  final  String? category;

  ArticleModel( {this.category,required this.image,required this.author,required this.title,required this.dateTime});

  static final List<ArticleModel> articlesList = [
    ArticleModel(
        author: 'abdalla',
        title: 'FCB is the best team ',
        dateTime: DateTime.now(),

        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'on is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'FCB is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'FCB is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'nile is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'FCB is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'nile is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'nile is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
    ArticleModel(
        author: 'abdalla',
        title: 'FCB is the best team ',
        dateTime: DateTime.now(),
        image:
        'https://www.cafonline.com/media/0luhsyfr/al-ahlys-starting-eleven-players-pose-for-the-group-photo-prior-the-caf-champions-league-2nd-qualifications.jpg'),
  ];
}