/* 1. Write a query that shows who is following a specified user.*/

%Note specified user is '@ben'

findall(X, follows(X, '@ben'), Followers).

/* 2. Write a query that shows all tweets posted by a specified user.*/

%Note specified user is '@jill'

findall([I, M], tweet('@jill', I, M), All_tweets).

/* 3. Write a query that shows how many users retweeted a specified tweet.*/

%Note specified tweet has I = 2

findall(X, retweet(X, 2), Retweeters), length(Retweeters, Num_retweets).

/* 4. Write a query that shows a particular user’s feed. Ensure that tweets of any users that the user follows are visible in the feed. */

%Note user passed is '@ben'

feed('@ben', Feed).

/* 5. Write a query that searches for a keyword in the universe of tweets.*/

%Note keyword passed is food.

findall(M, search(food, _, M), Search_results).

/* 6. Write a query that shows if a particular tweet is viral between the sender and a specified receiver. */

isviral('@leah', 2, '@jill').

/* 7. Write a query that shows if a particular tweet is viral between the sender and a specified receiver in no less than 3 levels of indirection.*/

isviral('@leah', 2, '@jill', 3).
isviral('@leah', 2, '@jill', 2).
isviral('@leah', 2, '@cooper', 2).
isviral('@leah', 2, '@cooper', 1).

