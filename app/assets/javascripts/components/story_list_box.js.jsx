var StoryListBox = React.createClass({
  loadStoryListFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadStoryListFromServer();
    EventEmitter.subscribe("storySwitched", this.loadStoryListFromServer);
  },
  componentDidUpdate: function() {
    $currentStory = $('.storyList ul li.story').not(".story-leave").first();
    if($currentStory.length) {
      POKER.story_id = $currentStory.data('id');
    } else {
      POKER.story_id = "";
      EventEmitter.dispatch("noStoriesLeft");
      drawBoard();
    }
  },
  render: function() {
    return (
      <div className="panel panel-default">
        <div className="panel-heading">Stories</div>
        <div id="storyListArea" className="panel-body row">
          <div className="storyListBox">
            <StoryList data={this.state.data} />
          </div>
        </div>
      </div>
    );
  }
});