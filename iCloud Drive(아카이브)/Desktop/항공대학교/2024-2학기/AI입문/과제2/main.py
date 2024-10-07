import random

class Agent:
    def __init__(self, program=None):
        self.alive = True
        self.performance = 0
        self.location = None # 추가

        if program is None:
            print("Can't find a valid program for {}, falling back to default.".format(self.__class__.__name__))
            def program(percept):
                return eval(input('Percept={}; action? '.format(percept)))

        self.program = program

    def is_alive(self):
        return hasattr(self, 'alive') and self.alive

class Environment:
    def __init__(self):
        self.agents = []

    def default_location(self, agent):
        """Default location to place a new thing with unspecified location."""
        return None

    def exogenous_change(self):
        """If there is spontaneous change in the world, override this."""
        pass

    def is_done(self):
        """By default, we're done when we can't find a live agent."""
        return not any(agent.is_alive() for agent in self.agents)

    def step(self):
        """Run the environment for one time step. If the
        actions and exogenous changes are independent, this method will
        do. If there are interactions between them, you'll need to
        override this method."""
        if not self.is_done():
            actions = []
            for agent in self.agents:
                if agent.alive:
                    actions.append(agent.program(self.percept(agent)))
                else:
                    actions.append("")
            for (agent, action) in zip(self.agents, actions):
                self.execute_action(agent, action)
            self.exogenous_change()

    def run(self, steps=1000):
        """Run the Environment for given number of time steps."""
        for step in range(steps):
            if self.is_done():
                return
            self.step()

    def add_agent(self, agent, location=None):
        """Add a thing to the environment, setting its location. For
        convenience, if thing is an agent program we make a new agent
        for it. (Shouldn't need to override this.)"""
        if not isinstance(agent, Agent):
            agent = Agent
        if agent in self.agents:
            print("Can't add the same agent twice")
        else:
            agent.location = location if location is not None else self.default_location(agent)
            #self.agents.append(agent)
            if isinstance(agent, Agent):
                agent.performance = 0
                self.agents.append(agent)

    def delete_agent(self, agent):
        """Remove a thing from the environment."""
        try:
            self.agents.remove(agent)
        except ValueError as e:
            print(e)
            print("  in Environment delete_thing")
            print("  Thing to be removed: {} at {}".format(agent, agent.location))
            print("  from list: {}".format([(agent, agent.location) for agent in self.agents]))
        if agent in self.agents:
            self.agents.remove(agent)


class TrivialVacuumEnvironment(Environment):
    """This environment has two locations, A and B. Each can be Dirty
    or Clean. The agent perceives its location and the location's
    status. This serves as an example of how to implement a simple
    Environment."""

    def __init__(self, status):
        super().__init__()
        if status == None:
            self.status = {loc_A: random.choice(['Clean', 'Dirty']),
                           loc_B: random.choice(['Clean', 'Dirty'])}
        else:
            self.status = status

    def add_agent(self, agent, location=None):
        '''에이전트를 환경에 추가하고 위치를 지정'''
        agent.location = location if location is not None else self.default_location()
        '''성능 점수 초기화'''
        agent.performance = 0
        self.agent = agent

    def percept(self, agent):
        """Returns the agent's location, and the location status (Dirty/Clean)."""
        return agent.location, self.status[agent.location]

    def execute_action(self, agent, action):
        """Change agent's location and/or location's status; track performance.
        Score 10 for each dirt cleaned; -1 for each move."""
        if action == 'Right':
            if agent.location == loc_A:
                agent.location = loc_B
                # 이동 시 패널티 -1
                agent.performance -= 1

        elif action == 'Left':
            if agent.location == loc_B:
                agent.location = loc_A
                # 이동 시 패널티 -1
                agent.performance -= 1

        elif action == 'Suck':
            if self.status[self.agent.location] == 'Dirty':
                self.status[agent.location] = 'Clean'

    def default_location(self):
        """Agents start in either location at random."""
        return random.choice([loc_A, loc_B])

    def run(self, steps=10):
        '''주어진 시간 동안 실행하여 점수를 평가'''
        for _ in range(steps):
            percept = self.percept(self.agent)
            action = self.agent.program(percept)
            self.execute_action(self.agent, action)

            for loc in [loc_A, loc_B]:
                if self.status[loc] == 'Clean':
                    self.agent.performance += 10

            print(f"Location: {percept[0]}, Status: {percept[1]}, Action: {action}, Performance: {self.agent.performance}")

def RandomVacuumAgent():
    def RandomAgentProgram(actions):
        return lambda percept: random.choice(actions)
    return Agent(RandomAgentProgram(['Right', 'Left', 'Suck']))


# Initial Conditions
loc_A, loc_B = (0, 0), (1, 0)  # The two locations for the Vacuum world
status = {loc_A: 'Dirty', loc_B: 'Dirty'}
steps = 10
initial_location = loc_A

# Running the agent program
agent = RandomVacuumAgent()
environment = TrivialVacuumEnvironment(status)
environment.add_agent(agent,initial_location)
environment.run(steps)

