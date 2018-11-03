'''
Example with featurize_text and rx_logistic_regression.
'''
import numpy
import pandas
from microsoftml import rx_logistic_regression, featurize_text, rx_predict
from microsoftml.entrypoints._stopwordsremover_predefined import predefined


train_reviews = pandas.DataFrame(data=dict(
    review=[
        "This is great", "I hate it", "Love it", "Do not like it", "Really like it",
        "I hate it", "I like it a lot", "I kind of hate it", "I do like it",
        "I really hate it", "It is very good", "I hate it a bunch", "I love it a bunch",
        "I hate it", "I like it very much", "I hate it very much.",
        "I really do love it", "I really do hate it", "Love it!", "Hate it!",
        "I love it", "I hate it", "I love it", "I hate it", "I love it"],
    like=[True, False, True, False, True, False, True, False, True, False,
        True, False, True, False, True, False, True, False, True, False, True,
        False, True, False, True]))
        
test_reviews = pandas.DataFrame(data=dict(
    review=[
        "This is great", "I hate it", "Love it", "Really like it", "I hate it",
        "I like it a lot", "I love it", "I do like it", "I really hate it", "I love it"]))

out_model = rx_logistic_regression("like ~ review_tran",
                    data=train_reviews,
                    ml_transforms=[
                        featurize_text(cols=dict(review_tran="review"),
                            stopwords_remover=predefined(),
                            keep_punctuations=False)])
                            
# Use the model to score.
score_df = rx_predict(out_model, data=test_reviews, extra_vars_to_write=["review"])
print(score_df.head())
